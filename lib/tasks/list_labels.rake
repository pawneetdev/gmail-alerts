require 'pp'

task :list_labels => :environment do

	client = Google::APIClient.new
	client.authorization.access_token = Token.last.fresh_token
	service = client.discovered_api('gmail')
	
	result = client.execute(
		api_method: service.users.labels.list,
		parameters: { 'userId' => 'me' })
	  
	pp JSON.parse(result.body)

end