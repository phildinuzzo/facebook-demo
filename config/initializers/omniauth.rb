
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '369820969802030', 'bfe134952ea8d0e1bc29171d880be6cd', :scope => 'read_stream'
end