module ErrorProcessorService

  CATEGORIES = {
      "production" => ["production", "job", "project"],
      "picking" => ["pick"],
      "shipping/receiving" => ["receipt", "receive", "ship"],
      "mobile" => ["mobile"],
      "moves" => ["move"]
  }

  def self.process(error)
    add_packman_info(error)
    categorize(error)
  end

  def self.add_packman_info(error)
    user = find_user(error.user_id)

    if user
      site = find_site(user)
      account = find_account(site)
      company = find_company(account)

      error.username = user.email
      error.site_name = site.name
      error.site_id = site.id
      error.account_name = account.name
      error.account_id = account.id
      error.company_name = company.name
      error.company_id = company.id
    end
  end

  def self.find_user(user_id)
    SnapshotDatabase::User.find_by_id(user_id)
  end

  def self.find_account(site)
    SnapshotDatabase::Account.find_by_id(site.account_id)
  end

  def self.find_site(user)
    SnapshotDatabase::Site.find_by_id((user.site_id))
  end

  def self.find_company(account)
    SnapshotDatabase::Company.find_by_id(account.company_id)
  end

  def self.categorize(error)
    CATEGORIES.each do |category, match_words|
      match_words.each do |match_word|
        unless error.controller.scan(match_word).empty?
          error.assign_attributes(category: category)
          break
        end
      end
    end
  end
end