class ReportsController < ApplicationController
  def showScheduleSummary
    @assignments = Tblscheduleassignments.includes(:tblclient).includes(:tblschedstatus).includes(:tblinterpreters).includes(:tblservicesfor).includes(:tblpersonalsched).includes(:tbllanguages)
  end

  def showScheduleSummary2
    results = ActiveRecord::Base.connection.execute("
      SELECT tblscheduleassignments.jobnumber,
      tblscheduleassignments.fromtime AS \"date\",
      tbllanguages.langname AS \"LanguageName\",
      tblscheduleassignments.fromtime,
      tblscheduleassignments.endtime,
      tblclient.clientname,
      tblscheduleassignments.clientid,
      tblscheduleassignments.ponumber,
      tblscheduleassignments.invoicenumber,
      tblschedstatus.schedstatus,
      coalesce(tblservicesfor.firstname,'') + ' ' + coalesce(tblservicesfor.lastname,'') AS servicesforname,
      coalesce(tblinterpreters.firstname,'') + ' ' + coalesce(tblinterpreters.mi,'') + ' ' + coalesce(tblinterpreters.lastname,'')
      AS interpretername,
      tblscheduleassignments.requestedby,
      tblscheduleassignments.requestedbyphone,
      tblscheduleassignments.notes_scheduler,
    tblscheduleassignments.servicecode,
      tblscheduleassignments.personalid,
      tblscheduleassignments.codeflags,
      tblscheduleassignments.billinggroupid,
      tblpersonalsched.schedulecode,
      coalesce(tblscheduleassignments.interpChanged,'0') as interpChanged,
      tblscheduleassignments.flagio,
      tblscheduleassignments.address,
      tblscheduleassignments.city,
      tblscheduleassignments.state,
      tblscheduleassignments.zipcode,
      tblschedstatus.bgcolor,
      tblschedstatus.fgcolor,
    substring(coalesce(codeflags,'--------'),1,1) AS \"SameDay\",
    substring(coalesce(codeflags,'--------'),6,1) AS \"SameDayBillRate\"
  FROM tblscheduleassignments LEFT JOIN
      tblclient ON
      tblclient.clientid = tblscheduleassignments.clientid
      LEFT JOIN
      tblschedstatus ON
      tblschedstatus.statusid = tblscheduleassignments.statusid
      LEFT JOIN
      tblinterpreters ON
      tblinterpreters.interpreterid = tblscheduleassignments.interpreterid
      LEFT JOIN
      tblservicesfor ON
      tblservicesfor.servicesforid = tblscheduleassignments.servicesforid
      LEFT JOIN
    tblpersonalsched ON
    tblpersonalsched.personalid = tblscheduleassignments.personalid
    LEFT JOIN
    tbllanguages ON
    tbllanguages.id = tblscheduleassignments.languageid
")
    @assignments = []
    results.each do |c|
      rec = {}
      results.fields.length.times do |i|
        rec[results.fields[i]] = c[i]
      end
      @assignments.append(rec)
    end
  end
end