class NameController < UIViewController

  # custom initializer dope
  def initWithNames
    initWithNibName(nil, bundle:nil)
    @data = {}
    # load up our hash with a-z keys and empty arrays
    ('A'..'Z').to_a.each {|e| @data[e] = [] }
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

  def sections
    # these should return in sorted form since that's how they 
    # were created
    # also notice this is returning an array
    @data.keys
  end

  def rows_for_section(section_index)
    @data[self.sections[section_index]]
  end

  def row_for_index_path(index_path)
    rows_for_section(index_path.section)[index_path.row]
  end

  def sectionIndexTitlesForTableView(tableView)
    sections
  end

  def numberOfSectionsInTableView(tableView)
    self.sections.count
  end

  def get_names(&block)
#    raise ArgumentError, "invalid gender type #{gender}" unless ['male','female'].include? gender
    # TODO: figure out the timing of this request
    # this should probably be moved into a startup controller

    BW::HTTP.get("http://localhost:3000/names.json/") do |response|
      array_of_hashes = BW::JSON.parse(response.body.to_str)
      array_of_hashes.each do |h| 
        n = Name.new(h)
        @data[n.spelling[0]] << n
      end
      block.call()
    end 
  end

  def tableView(tableView, numberOfRowsInSection:section)
    rows_for_section(section).count
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    @reuseIdentifier ||= "CELL_IDENTIFIER"

    cell = tableView.dequeueReusableCellWithIdentifier(@reuseIdentifier) || begin
      UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:@reuseIdentifier)
    end

    # put your data in the cell
    cell.textLabel.text = row_for_index_path(indexPath).spelling
    cell.detailTextLabel.text = row_for_index_path(indexPath).phonetic

    cell
  end

end
