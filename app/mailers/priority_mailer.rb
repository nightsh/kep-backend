class PriorityMailer < ApplicationMailer

  def notify_chosen(user,object)
    @user=user
    @object = object
    @url = 'http://localhost:3000/v1/'+ @object.class.to_s.downcase.pluralize + '/' + @object.id.to_s
    mail(to: @user.email, subject: 'You have been chosen as priority')
  end

  def notify_owner(owner,object,last_lvl_time)
    @owner = owner
    @object = object
    @last_lvl_time = last_lvl_time
    @url = 'http://localhost:3000/v1/'+ @object.class.to_s.downcase.pluralize + '/' + @object.id.to_s
    mail(to: @owner.email, subject: 'All priorities have been notified')
  end

end
