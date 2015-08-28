module HttpsHelper
  def with_https_enabled
    stub_const("Hound::ENABLE_HTTPS", "yes")
    yield
    stub_const("Hound::ENABLE_HTTPS", "no")
  end
end
