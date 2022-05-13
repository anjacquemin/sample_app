class ApplicationController < ActionController::Base
  include SessionsHelper
  def hello
    render html: "hola"
  end
end
