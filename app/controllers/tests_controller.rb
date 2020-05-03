class TestsController < ApplicationController
  before_action :check_permission
  before_action :set_test, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tests = Test.includes(:questions).order(:created_at).page params[:page]
    respond_with(@tests)
  end

  def show
    respond_with(@test)
  end

  def new
    @test = Test.new
    @question = @test.questions.build()
    @option = @question.options.build()
    respond_with(@test)
  end

  def edit
  end

  def create
    @test = Test.new(test_params)
    flash[:notice] = 'Test was successfully created.' if @test.save
    respond_with(@test)
  end

  def update
    flash[:notice] = 'Test was successfully updated.' if @test.update(test_params)
    respond_with(@test)
  end

  def destroy
    @test.destroy
    respond_with(@test)
  end

  private
    def set_test
      @test = Test.includes(:questions, :options).find(params[:id])
    end

    def test_params
      params.require(:test).permit(
        :name, 
        :description,
        questions_attributes: [
          :_destroy,
          :id,
          :test_id,
          :content,
          :description,
          options_attributes: options_attributes
        ]
      )
    end

    def options_attributes
      [
        :_destroy,
        :id,
        :question_id,
        :content,
        :description,
        :is_correct_answer
      ]
    end
end
