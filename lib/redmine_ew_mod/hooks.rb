module RedmineEwMod
  class Hooks < Redmine::Hook::ViewListener

    # This creates the additional form element on the timelog edit/new form
    render_on(:view_timelog_edit_form_bottom, :partial => 'timelog_edit_bottom', :layout => false)

    # This saves the user attribute on
    # form submit
    def controller_timelog_edit_before_save(context={})
      if context[:params][:action] == 'create'
        # get the user id submitted by the form
        user_id = context[:params][:user][:user_id]
        begin
          selected_user = User.find(user_id.to_i)

          # get the time_entry given by the hook
          time_entry = context[:time_entry]

          # set the user
          time_entry.attributes = { :user => selected_user }
        rescue
          # don't do anything. The hook caller will have set the user
          # with User.current
        end
      end
    end
  end
end
