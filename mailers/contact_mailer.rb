class ContactMailer < SinatraMore::MailerBase
  def contact_email(contact_name, email, message)
    from 'portfolio_admin@portfolio.com'
    to 'marinar578@gmail.com'
    subject 'New portfolio contact info!'
    @mail_attributes[:body] = {:name => contact_name, :email => email, :message => message}
    via     :sendmail             # optional, to smtp if defined otherwise sendmail
  end
end