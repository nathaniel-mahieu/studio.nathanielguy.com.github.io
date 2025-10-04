class User < ActiveRecord::Base 
  def self.authenticate(username, passwd) 
    #find_first([ "username = ? AND passwd =?", username, Digest::SHA1.hexdigest(passwd) ]) 
    if passwd == 'xxxx' and username == 'nathanielguy'
      true
    end
  end 
end
