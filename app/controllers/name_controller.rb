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
    # TODO: Why is @data empty after this call?

    BW::HTTP.get("http://localhost:3000/names.json/") do |response|
      array_of_hashes = BW::JSON.parse(response.body.to_str)
      array_of_hashes.each { |h| @data << Name.new(h) }
    end 

    @data
  end


end