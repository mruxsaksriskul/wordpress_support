Chef::Log.warn('***************** Creating a fake Data Bag with real SSH key for Github Account')

# git_ssh_key = node['GIT_SSH_KEY'] # set in .kitchen.yml
# git_key_var = '<@GIT_SSH_KEY@>'

BAG_PATH = Chef::Config[:data_bag_path]
TARGET_BAG = 'wordpress/vabig.json'
BAG_FILE = BAG_PATH + '/' + TARGET_BAG
BACKUP_FILE = BAG_FILE + '.old'

Chef::Log.warn('***************** Using bag: ' + BAG_FILE)

edit_file = Chef::Util::FileEdit.new(BAG_FILE)
# edit_file.search_file_replace(git_key_var, git_ssh_key)
edit_file.write_file

File.delete(BACKUP_FILE) if File.exist?(BACKUP_FILE) # FileEdit creates, but does not remove, a backup file.
