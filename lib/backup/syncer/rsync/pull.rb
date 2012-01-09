# encoding: utf-8

module Backup
  module Syncer
    module RSync
      class Pull < Push

        ##
        # Performs the RSync operation
        # debug options: -vhP
        def perform!
          @directories.each do |directory|
            Logger.message("#{ self.class } started syncing '#{ directory }'.")
            Logger.silent(
              run("#{ utility(:rsync) } #{ options } '#{ username }@#{ ip }:#{ directory }' '#{ path }'")
            )
          end
          remove_password_file!
        end
      end
    end
  end
end