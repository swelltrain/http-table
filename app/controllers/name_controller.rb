class NameController < UIViewController

  # custom initializer dope
  def initWithNames
    initWithNibName(nil, bundle:nil)
    @data = []
    self.get_names do
      @table = UITableView.alloc.initWithFrame(self.view.bounds)
      @table.delegate = self
      @table.dataSource = self
      self.view.addSubview(@table)  
    end
    self
  end
  
  def viewDidLoad
    super
    self.title = "Pick Your Child's Name"    
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

  def get_names(&block)
#    raise ArgumentError, "invalid gender type #{gender}" unless ['male','female'].include? gender
    # TODO: figure out the timing of this request
    # i believe it is asynch, can we make it synch?
    # this should probably be moved into a startup controller

    BW::HTTP.get("http://localhost:3000/names.json/") do |response|
      array_of_hashes = BW::JSON.parse(response.body.to_str)
      array_of_hashes.each { |h| @data << Name.new(h) }
      block.call()
    end 

  end

end
