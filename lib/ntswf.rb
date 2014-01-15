module Ntswf
  AUTOLOAD = %w(
    ActivityWorker
    Client
    DecisionWorker
    Utils
  )

  AUTOLOAD.each { |c| autoload c.to_sym, "ntswf/#{c.gsub(/.(?=[A-Z])/, '\0_').downcase}.rb" }

  def self.included(base)
    base.module_exec do
      AUTOLOAD.each { |c| include const_get c }
    end
  end
end