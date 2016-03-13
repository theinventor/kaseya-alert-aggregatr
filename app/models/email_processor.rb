class EmailProcessor
  #https://github.com/thoughtbot/griddler

  def initialize(email)
    @email = email
  end

  def process
    EmailAlert.create!({ all_params: @email, subject: @email.subject })

    EmailAlert.clean_old_entries_from_db!
  end
end