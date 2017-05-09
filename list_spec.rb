require "rspec-given"
require "rspec"
require_relative "list"
require_relative "task"

describe List do
  # Your specs here
  let(:title) {"Animals"}
  let(:empty_array) {[]}
  let(:list) {List.new(title)}
  let(:description) { "Walk the giraffe" }
  let(:task)        { Task.new(description) }
  let(:task2)        { Task.new("Annoy the cat") }
  
  describe "#initialize" do
    it "takes a string as an argument" do
      expect(List.new("Hug fat cat")).to be_a_kind_of(List)
    end
    it "requires one arguments" do
      expect {List.new}.to raise_error(ArgumentError)
    end
  end
  
  describe "#title" do
    it "shows the title of the list" do
      expect(list.title).to eq(title) 
      # eq = equalize 
    end
  end
  
  
  describe "#add_task(task)" do
    it "adds new task to the array" do
      list.add_task(task)
      expect(list.tasks).not_to be_empty
    end
  end
  
  describe "#complete_task(index)" do
    it "marks a task of specific index(num) as completed" do
      list.add_task(task)
      list.complete_task(0)
      expect(list.tasks[0].complete?).to be true
    end
  end
  
  describe "#delete_task(index)" do
    it "removes a task at a particular index" do
      list.add_task(task)
      list.delete_task(0)
      expect(list.tasks).to be_empty
    end
  end
 
  describe "#completed_tasks" do
    it "selects all tasks that are completed" do
      list.add_task(task)
      list.complete_task(0)
      list.add_task(task2)
      expect(list.completed_tasks.count).to be 1
    end
  end
  
  describe "#incomplete_tasks" do
      it "selects all tasks that are not completed" do
        list.add_task(task)
        list.complete_task(0)
        list.add_task(task2)
        expect(list.incomplete_tasks.count).to be 1
      end
    end
end
