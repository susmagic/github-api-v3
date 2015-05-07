require 'github_api'


puts 'Please provide github auth token:'
token = gets.strip

if token.empty?
  puts 'No token provided. Exiting...'
  exit
end

puts 'Please provide repo name:'
repo_name = gets.strip

if repo_name.empty?
  puts 'No repo name provided. Exiting...'
  exit
end

client = Github.new(oauth_token: token)
repos_list = client.repos.list
if repo_index = repos_list.map(&:name).index(repo_name)
	puts 'Repo found'
	if repos_list[repo_index].created_at == repos_list[repo_index].updated_at
		puts "\033[32mRepo empty!"
	else
		puts "\033[31mRepo not empty!"
	end
else
	puts "\033[31mRepo not found"
end
