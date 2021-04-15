class Alert
  include Capybara::DSL

  def dark
    return alert = find(".alert-dark").text
  end
end
