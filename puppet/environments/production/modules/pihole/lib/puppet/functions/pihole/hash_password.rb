Puppet::Functions.create_function('pihole::hash_password') do
  dispatch :hash_password do
    param 'String', :plain_password
  end

  def hash_password(plain_password)
    require 'digest'
    # Double SHA256, that's what pihole uses
    first = Digest::SHA256.hexdigest(plain_password)
    Digest::SHA256.hexdigest(first)
  end
end
