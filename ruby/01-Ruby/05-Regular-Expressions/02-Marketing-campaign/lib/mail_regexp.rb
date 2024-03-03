def valid?(email)
  # TODO: return true if the email is valid, false otherwise
  email.match?(/^\w+@\w+\.\w+$/)
end

def clean_database(emails)
  # TODO: return an array with the valid emails only
  array = []
  emails.each { |e| array.push(e) if e.match?(/\w+@\w+\.\w+/) }
  array
end

def group_by_tld(emails)
  # TODO: return a Hash with emails grouped by TLD
  hash = {}
  emails.each do |e|
    pattern = e.match(/\.(\w+)$/)
    hash.key?(pattern[1]) ? hash[pattern[1]].push(e) : hash[pattern[1]] = [].push(e)
  end
  hash
end

def compose_mail(email)
  # TODO: return a Hash with username, domain and tld extracted from email
  md = email.match(/(?<username>\w+)@(?<sld>\w+)\.(?<tld>\w+)/)
  { username: md[:username], domain: md[:sld], tld: md[:tld] }
end

LOCALES = {
  en: {
    subject: "Our website is online",
    body: "Come and visit us!",
    closing: "See you soon",
    signature: "The Team"
  },
  fr: {
    subject: "Notre site est en ligne",
    body: "Venez nous rendre visite !",
    closing: "A bientot",
    signature: "L'équipe"
  },
  de: {
    subject: "Unsere Website ist jetzt online",
    body: "Komm und besuche uns!",
    closing: "Bis bald",
    signature: "Das Team"
  }
}

def compose_translated_email(email)
  # TODO: return a Hash with username, domain and tld extracted from email
  # TODO: translate subject, body, closing and signature, according to TLD
  mail = compose_mail(email)
  hash = {}

  if LOCALES.key?(mail[:tld].to_sym)
    LOCALES[mail[:tld].to_sym].each { |k, v| hash[k] = v }
  else
    LOCALES[:en].each { |k, v| hash[k] = v }
  end
  mail.each { |k, v| hash[k] = v }

  hash
end
