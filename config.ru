require 'rubygems'
require 'gollum/app'

gollum_path = File.expand_path(File.dirname('gollum'))
Precious::App.set(:gollum_path, gollum_path)
Precious::App.set(:wiki_options, {})
run Precious::App

# Add in commit user/email
class Precious::App
  before do
    session['gollum.author'] = {
        :name       => "%s %s" % [env['firstName'], env['lastName']],
        :email      => "%s@github.com" % env['username'],
    }
  end
end