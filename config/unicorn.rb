# -*- coding: utf-8 -*-
rails_root = File.expand_path('../../', __FILE__)
# RAILS_ENVを求める。（RAILS_ENV毎に挙動を変更したい場合に使用。今回は使用しません。)
# rails_env = ENV['RAILS_ENV'] || "development"

# 追記に記載してます。入れた方がいいです。
ENV['BUNDLE_GEMFILE'] = rails_root + "/Gemfile"


worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 15
preload_app true  # 更新時ダウンタイム無し

listen "/var/run/unicorn.sock"
pid "/var/run/unicorn.pid"


before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end

# ログの出力
stderr_path File.expand_path('/var/www/gurume/log/unicorn.log', ENV['RAILS_ROOT'])
stdout_path File.expand_path('/var/www/gurume/log/unicorn.log', ENV['RAILS_ROOT'])
