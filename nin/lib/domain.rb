class FrontEndDomain
  def self.matches?(request)
    if Rails.env.development?
      return true
    else
      request.domain.present? && request.domain == APP_CONFIG[:frontend_domain]
    end
  end
end

class BackEndDomain
  def self.matches?(request)
    if Rails.env.development?
      return true
    else
      request.domain.present? && request.domain == APP_CONFIG[:backend_domain]
    end
  end
end
