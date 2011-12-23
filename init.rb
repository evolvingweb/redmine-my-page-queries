require 'redmine'
require_dependency 'redmine_ew_mod/hooks'

Redmine::Plugin.register :redmine_ew_mod do
  name 'Evolving Web Custom My Page Queries'
  author 'Evolving Web Inc'
  description 'Misc redmine custom queries.'
  version '0.0.1'
  author_url 'http://evolvingweb.ca'
end
