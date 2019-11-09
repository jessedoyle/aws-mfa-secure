module AwsMfaSecure
  class CLI < Command
    desc "session *ARGV", "Calls aws cli with a MFA secure session"
    long_desc Help.text(:session)
    def session(*argv)
      Session.new(options, *argv).run
    end

    desc "exports", "Generate export statements that can be eval"
    long_desc Help.text(:exports)
    def exports
      Exports.new(options).run
    end

    desc "unsets", "Generate unsets statements that can be eval"
    long_desc Help.text(:unsets)
    def unsets
      Unsets.new(options).run
    end

    desc "completion *PARAMS", "Prints words for auto-completion."
    long_desc Help.text("completion")
    def completion(*params)
      Completer.new(CLI, *params).run
    end

    desc "completion_script", "Generates a script that can be eval to setup auto-completion."
    long_desc Help.text("completion_script")
    def completion_script
      Completer::Script.generate
    end

    desc "version", "prints version"
    def version
      puts VERSION
    end
  end
end
