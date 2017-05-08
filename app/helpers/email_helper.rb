module EmailHelper

  FIRST_NAME_LAST_NAME_FORMULA = 1
  LAST_NAME_FIRST_NAME_FORMULA = 2
  FIRST_NAME_INITIAL_LAST_NAME_FORMULA = 3

  def self.get_type(fullname,email)
    firstname = fullname.downcase.split(" ").first
    lastname = fullname.downcase.split(" ").last

    return FIRST_NAME_LAST_NAME_FORMULA if "#{firstname.strip}#{lastname.strip}" == email.split('@').first
    return LAST_NAME_FIRST_NAME_FORMULA if "#{lastname.strip}#{firstname.strip}" == email.split('@').first
    return FIRST_NAME_INITIAL_LAST_NAME_FORMULA if "#{firstname.strip[0]}#{lastname.strip}" == email.split('@').first
  end

  def self.translate(type, company, fullname)
    firstname = fullname.downcase.split(" ").first
    lastname = fullname.downcase.split(" ").last
    case type
    when FIRST_NAME_LAST_NAME_FORMULA
      "#{firstname.strip}#{lastname.strip}@#{company}"
    when LAST_NAME_FIRST_NAME_FORMULA
      "#{lastname.strip}#{firstname.strip}@#{company}"
    when FIRST_NAME_INITIAL_LAST_NAME_FORMULA
      "#{firstname.strip[0]}#{lastname.strip}@#{company}"
    else
      raise "Unable to translate from type #{type}. Please provide a valid type"
    end

  end

end
