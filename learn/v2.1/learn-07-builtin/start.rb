
group "learn-07-builtin" do
  service('firewalld').is_running?
  service('sshd').is_running?
end

play do
  show
  export
end
