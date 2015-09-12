# encoding: utf-8

task :br do
  fetch_rsssf( BR_BASE, BR, 'braz', BR_REPO )
end

task :br2 do
  stats = []

  cfg = ScheduleConfig.new
  cfg.name = '1-seriea'
  cfg.find_schedule_opts_for_year = ->(year) {  Hash[ header: 'S.rie A' ] }
  cfg.dir_for_year = ->(year) { year.to_s }   ## note: no mapping (season runs all year)
   ## Série A
   ## fix: utf-8 issue;  use S.rie A for now

  stats += make_schedules( BR, 'braz', BR_REPO, cfg )

  make_readme( 'Brazil (Brasil)', BR_REPO, stats )
end

