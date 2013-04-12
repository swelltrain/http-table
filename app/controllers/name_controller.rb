class NameController < UIViewController
  def viewDidLoad
    super

    # just make a competely empty table for now
    self.title = "Pick Your Child's Name"
    @data = []

    @table = UITableView.alloc.initWithFrame(self.view.bounds)
    @table.delegate = self
    @table.dataSource = self
    self.get_names('male')

    self.view.addSubview(@table)
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:@reuseIdentifier)
    end

    # put your data in the cell
    cell.textLabel.text = @data[indexPath.row].spelling
    cell.detailTextLabel.text = @data[indexPath.row].phonetic

    cell

  end

  def tableView(tableView, numberOfRowsInSection:section)
    @data.count
  end

  def get_names(gender)
    raise ArgumentError, "invalid gender type #{gender}" unless ['male','female'].include? gender
    # TODO: This will need to:
    # call the server to get a list of names as json, 
    # instantiate them
    # and return as an array of Name objects

    # For testing just create the array of name objects

    @data =[ Name.new({id: 1, spelling: 'A. J.', phonetic: 'AY - Jay'}) ,
Name.new({id: 2, spelling: 'Aaliyah', phonetic: 'Ah - LEE - Ah'}) ,
Name.new({id: 3, spelling: 'Aari', phonetic: 'ARE - Ee'}) ,
Name.new({id: 4, spelling: 'Aariella', phonetic: 'Are - Ee - ELL - Ah'}) ,
Name.new({id: 5, spelling: 'Aaron', phonetic: 'AIR - Ren'}) ,
Name.new({id: 6, spelling: 'Aaron', phonetic: 'AR - En'}) ,
Name.new({id: 7, spelling: 'Abbey', phonetic: 'ABB - Bee'}) ,
Name.new({id: 8, spelling: 'Abbigail', phonetic: 'ABB - Eh - Gail'}) ,
Name.new({id: 9, spelling: 'Abdiel', phonetic: 'AB - Dee -Ell'}) ,
Name.new({id: 10, spelling: 'Abdullah', phonetic: 'Abb - DOO - Lah'}) ,
Name.new({id: 11, spelling: 'Abel', phonetic: 'AYB - Ell'}) ,
Name.new({id: 12, spelling: 'Abraham', phonetic: 'AYB - Brah - Ham'}) ,
Name.new({id: 13, spelling: 'Abram', phonetic: 'AY - Bram'}) ,
Name.new({id: 14, spelling: 'Abrielle', phonetic: 'AY - Bree - El'}) ,
Name.new({id: 15, spelling: 'Acacia', phonetic: 'Ah - KAY - Shah'}) ,
Name.new({id: 16, spelling: 'Adair', phonetic: 'Ah - DAIR'}) ,
Name.new({id: 17, spelling: 'Adam', phonetic: 'ADD - Amm'}) ,
Name.new({id: 18, spelling: 'Addie', phonetic: 'ADD - Ee' }) ,
Name.new({id: 19, spelling: 'Addison', phonetic: 'ADD - Eh - Son' }) ,
Name.new({id: 20, spelling: 'Adelaide', phonetic: 'AD - Ah - Laid' }) ,
Name.new({id: 21, spelling: 'Adeline', phonetic: 'ADD - Eh - Lyen' }) ,
Name.new({id: 22, spelling: 'Adelle', phonetic: 'Ah - DELL' }) ,
Name.new({id: 23, spelling: 'Adolfo', phonetic: 'Ah - DOLF - Oh' }) ,
Name.new({id: 24, spelling: 'Adonis', phonetic: 'Ah - DON - Iss' }) ,
Name.new({id: 25, spelling: 'Adrian', phonetic: 'AYD - Dree - An'}) ,
Name.new({id: 26, spelling: 'Adriana', phonetic: 'Ayd - Dree - AUN - Ah' }) ,
Name.new({id: 27, spelling: 'Adrianna', phonetic: 'AY - Dree - ANN - Ah'}) ,
Name.new({id: 28, spelling: 'Adriel', phonetic: 'ADD - Ree - Ell'}) ,
Name.new({id: 29, spelling: 'Agnes', phonetic: 'AG - Nes' }) ,
Name.new({id: 30, spelling: 'Ahmad', phonetic: 'Ah - MAHD' }) ,
Name.new({id: 31, spelling: 'Ahmed', phonetic: 'Ah - MED'}) ]

  end
end