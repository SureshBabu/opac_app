class IbtrMailer < ActionMailer::Base
  default :from => "mc@strataretail.co"
  
  def cancelled_notification(ibtr)
    @url = "http://example.com"
    mail(:to => 'akhilesh.kataria@strata.co.in',
         :subject => "This comes from rails")
  end
end
