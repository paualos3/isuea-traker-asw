OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '701887425112-slu5f498shohsvalvcjtdlfmolo4vd92.apps.googleusercontent.com', '7Vg-jPvS9dctZQ0xqmbWwC6u'
end