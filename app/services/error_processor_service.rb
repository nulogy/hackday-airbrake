module ErrorProcessorService

  def self.process(error)
    add_extra_info(error)
  end

  def self.add_extra_info(error)
    user = find_user(error.user_id)
    site = find_site(user)
    account = find_account(site)
    company = find_company(account)

    error.username = user.email
    error.site_name = site.name
    error.account_name = account.name
    error.company_name = company.name
    error.save!
  end

  def self.find_user(user_id)
    SnapshotDatabase::User.find_by_id user_id
  end

  def self.find_account(site)
    SnapshotDatabase::Account.find_by_id site.account_id
  end

  def self.find_site(user)
    SnapshotDatabase::Site.find_by_id user.site_id
  end

  def self.find_company(account)
    SnapshotDatabase::Company.find_by_id account.company_id
  end
end