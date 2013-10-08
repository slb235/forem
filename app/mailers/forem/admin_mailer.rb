module Forem
  class AdminMailer < ActionMailer::Base
    default :from => Forem.email_from_address

    def new_post(post_id)
      @post = Post.find(post_id)
      
      Forem.user_class.where(:forem_admin => true).each do |admin|
        mail(:to => admin.email, :subject => I18n.t('forem.topic.received_reply'))
      end    
    end
  end
end
