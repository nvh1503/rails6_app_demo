# UserService::Creator.new(params).exec
module UserService
  class Creator
    attr_reader :params, :headers

    def initialize(params, headers: nil)
      @params   = params
      @headers  = headers
    end

    def exec
      user = User.new(params)
      if user.save
        send_confirmation_email(user)
      end
      user
    end

    def send_confirmation_email(user)
      # todo: implement function for sending email to user
      puts "======= Send email to user ========"
    end

  end
end