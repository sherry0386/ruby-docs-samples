# Copyright 2015 Google, Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# [START receive_push_message]
require "sinatra"
require "json"
require "base64"

post "/push" do
  message = JSON.parse request.body.read
  data = Base64.decode64 message["message"]["data"]
  logger.info "Pushed Message: #{data}"
  response.status = 204
end
# [END receive_push_message]

set :port, 8080