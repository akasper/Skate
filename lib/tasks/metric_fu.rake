MetricFu::Configuration.run do |config|
  config.rcov = {
    :environment  => 'test',
    :run_cucumber => true,
    :test_files   => ['spec/**/*_spec.rb', 'features/*.feature'],
    :rcov_opts    => [
      '--sort coverage',
      '--no-html',
      '--text-coverage',
      '--no-color',
      '--profile',
      '--rails',
      '--exclude /gems/,/Library/,/usr/,spec,features',
      '--include /app/,/lib/',
      '-Ispec'
      ],
    :external     => nil
  }
end
