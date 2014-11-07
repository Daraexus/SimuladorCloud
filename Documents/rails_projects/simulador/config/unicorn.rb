root = "/home/ubuntu/cloud_project/SimuladorCloud/Documents/rails_projects/simulador"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/var/sockets/unicorn.phindee.sock"
worker_processes 
timeout 30
