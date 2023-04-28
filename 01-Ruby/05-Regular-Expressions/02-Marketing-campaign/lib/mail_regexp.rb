def valid?(email)
  # TODO: return true if the email is valid, false otherwise
  if email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    return true
  else
    return false
  end
end

def clean_database(emails)
  # TODO: return an array with the valid emails only
  emails.select { |email| valid?(email) }
end

def group_by_tld(emails)
  # TODO: return a Hash with emails grouped by TLD
  emails.group_by { |email| email.split('.').last }
end

def compose_mail(email)
  # TODO: return a Hash with username, domain and tld extracted from email
  email_hash = {}
  email_hash[:username], email_hash[:domain], email_hash[:tld] = email.split(/[@.]/)
  email_hash
end

def compose_translated_email(email)
  email_hash = compose_mail(email)
  translation = load_translation(email_hash[:tld])

  translated_email(translation, email_hash)
end

def load_translation(tld)
  case tld
  when 'com' then com_translation
  when 'fr' then fr_translation
  when 'de' then de_translation
  else default_translation
  end
end

def com_translation
  {
    subject: 'Our website is online',
    body: 'Come and visit us!',
    closing: 'See you soon',
    signature: 'The Team'
  }
end

def fr_translation
  {
    subject: 'Notre site est en ligne',
    body: 'Venez nous rendre visite !',
    closing: 'A bientot',
    signature: "L'équipe"
  }
end

def de_translation
  {
    subject: 'Unsere Website ist jetzt online',
    body: 'Komm und besuche uns!',
    closing: 'Bis bald',
    signature: 'Das Team'
  }
end

def default_translation
  {
    subject: 'Hello',
    body: 'Dear recipient, this is a message from...',
    closing: 'Regards,',
    signature: 'Sender'
  }
end

def translated_email(translation, email_hash)
  {
    subject: translation[:subject],
    body: translation[:body],
    closing: translation[:closing],
    signature: translation[:signature],
    username: email_hash[:username],
    domain: email_hash[:domain],
    tld: email_hash[:tld]
  }
end
