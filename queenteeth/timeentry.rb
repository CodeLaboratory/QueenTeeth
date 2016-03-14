class TimeEntry < ActiveResource::Base

  self.site = HOST
  self.user = USER
  self.password = PASSWORD
  self.include_root_in_json = true
  
end
