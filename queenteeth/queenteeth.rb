class QueenTeeth

  @@in_default = false

  def run(arguments)
    if(arguments[0].nil?)
        puts "\e[1m\e[35m"+"QueenTeeth — don't forget to track your f*cking times."+"\e[0m\e[22m"
        puts
        showHelp()
    end

    if(! self.isReady)
      self.install()
      self.init()
    end

    self.trackTime(arguments[0], arguments[1], arguments[2], arguments[3])
  end

  def isReady()
    self.isFile(File.expand_path('/usr/local/bin/queenteeth'))
  end

  def install()
    puts "\e[1m"+"This is a one time configuration. Hold on a bit."+"\e[22m"
    puts
    puts "\e[1m"+"Installing dependencies..."+"\e[22m"
    
    installed = system("sudo gem install chronic")

    if(! installed)
      puts "\e[31m"+"Error: Couldn't install dependency."+"\e[0m"
      puts "Try manually: sudo gem install chronic"
    end

    installed = system("sudo gem install activeresource")

    if(! installed)
      puts "\e[31m"+"Error: Couldn't install dependency."+"\e[0m"
      puts "Try manually: sudo gem install activeresource"
    end
  end

  def init(a=nil, b=nil, c=nil, d=nil)
    puts
    puts "\e[1m"+"Initializing..."+"\e[22m"

    system("cp queenteeth.rb /usr/local/bin/queenteeth")

    puts "\e[1m\e[32m"+"QueenTeeth is ready"+"\e[0m\e[22m"
    puts
  end

  def trackTime(case_id, message, time = 1, date = nil)
    issue_id = self.getIssueId(case_id)

    self.timeEntry(issue_id, message, time, date)
  end

  def getIssueId(case_id)
    issues = Issue.find(:all, :params => {:cf_91808406 => case_id, :limit => 100})

    if(!issues.first.nil?)
      return issues.first.id
    else
      @@in_default = true
      return DEFAULT_ISSUE_ID
    end
  end

  def timeEntry(issue_id, message, time = 1, date = nil)
    require 'chronic'

    if(date.nil?)
      date = Time.now
    end

    date = Chronic.parse(date.to_s).strftime('%Y-%m-%d').to_s

    if(time.nil?)
      time = 1
    end

    time = TimeEntry.new(
      :issue_id => issue_id,
      :comments => message,
      :hours => time,
      :spent_on => date,
      :activity_id => 9,
    )

    if time.save
      default_txt = ''
      if(@@in_default)
        default_txt = ' default'
      end

      puts "\e[35m"+"✓\e[0m Time tracked in" + default_txt + " issue " + issue_id.to_s
    else
      puts time.errors.full_messages
    end
  end

  def isFile(file)
    File.exist?(file)
  end

  def showHelp()
    puts "\e[1m"+"Usage:"+"\e[22m"
    puts "    queenteeth {case_id} {comment} {time_spent} {entry_date}"
    puts
    puts "\e[1m"+"Examples:"+"\e[22m"
    puts "    case_id       128  (FogBugz case)"
    puts "    comment       'Fixing an annoying bug'"
    puts "    time_spent    1.5  (hours)"
    puts "    entry_date    yesterday|'last friday'|'2016-03-14'"
    exit
  end

end
