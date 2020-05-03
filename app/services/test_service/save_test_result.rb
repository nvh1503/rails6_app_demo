# TestService::SaveTestResult.new(params).exec
module TestService
  class SaveTestResult
    attr_reader :params

    def initialize(params)
      @params   = params
    end

    def exec
      # todo: implement to save test result
      puts "========= SaveTestResult - test result params: ", params
    end

  end
end