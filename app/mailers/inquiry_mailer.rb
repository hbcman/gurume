class InquiryMailer < ActionMailer::Base
  default from: "noreply_itlbe@itlbe.com"   # 送信元アドレス
  default to: "ricca.niigata@gmail.com"     # 送信先アドレス
 
  def received_email(inquiry)
    @inquiry = inquiry
    mail(:subject => 'グルぐる歩に関するお問い合わせ')
  end
 
end