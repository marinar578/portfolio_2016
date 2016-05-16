class ContactMailer < SinatraMore::MailerBase
  def contact_email(contact_name, email, message)
    from 'portfolio_admin@portfolio.com'
    to 'marinar578@gmail.com'
    subject 'New portfolio contact info!'
    # binding.pry
    @mail_attributes[:body] = {:name => contact_name, :email => email, :message => message}
    # body    :name => contact_name, :email => email, :message => message
    # type    'html'                # optional, defaults to plain/text
    # charset 'windows-1252'        # optional, defaults to utf-8
    via     :sendmail             # optional, to smtp if defined otherwise sendmail
  end
end