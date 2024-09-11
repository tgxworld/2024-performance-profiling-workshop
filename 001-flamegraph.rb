require "json"
require "stackprof"

class SlothVirus
  def self.sleep_10
    sleep_2
    sleep_2
    sleep_1
    sleep_4
    sleep_1
  end

  def self.sleep_4
    sleep_2
    sleep_2
  end

  def self.sleep_2
    sleep_1
    sleep_1
  end

  def self.sleep_1
    sleep 1
  end
end

profile =
  StackProf.run(mode: :wall, raw: true) do
    SlothVirus.sleep_1
    SlothVirus.sleep_2
    SlothVirus.sleep_4
    SlothVirus.sleep_10
  end

File.write("/tmp/stackprof.json", JSON.generate(profile))

`speedscope /tmp/stackprof.json`
