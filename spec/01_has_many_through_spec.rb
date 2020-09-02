equire "spec_helper"

describe "Basic class structures" do

  before(:example) do
    Customer.class_variable_set(:@@all, [])
    Waiter.class_variable_set(:@@all, [])
    Meal.class_variable_set(:@@all, [])
  end

  describe "Customer" do
    describe "#new" do
      it "initializes with a name and age" do
        expect{Customer.new("Ian", 30)}.to_not raise_error
      end
    end

    describe ".all" do
      it "is class method that returns the contents of @@all" do
        expect(Customer.all).to eq([])
        ian = Customer.new("Ian", 30)

        expect(Customer.all).to eq([ian])
        niky = Customer.new("Niky", 28)
        expect(Customer.all).to eq([ian, niky])
      end
    end
  end

  describe "Waiter" do
    describe "#new" do
      it "initializes with a name and years of experience" do
        expect{Waiter.new("Ian", 3)}.to_not raise_error
      end
    end

    describe ".all" do
      it "is class method that returns the contents of @@all" do
        expect(Waiter.all).to eq([])
        ian = Waiter.new("Ian", 3)

        expect(Waiter.all).to eq([ian])
        niky = Waiter.new("Niky", 2)
        expect(Waiter.all).to eq([ian, niky])
      end
    end
  end

  require "spec_helper"


  describe "Meal" do
    describe "#new" do
      it "initializes with a waiter, a customer, a total and a tip" do
        ian = Customer.new("Ian", 30)
        niky = Waiter.new("Niky", 28)

        expect{Meal.new(niky, ian, 50, 3)}.to_not raise_error
      end
    end

    describe ".all" do
      it "is class method that returns the contents of @@all" do
        ian = Customer.new("Ian", 30)
        niky = Waiter.new("Niky", 28)

        expect(Meal.all).to eq([])
        a = Meal.new(niky, ian, 50, 3)
        b = Meal.new(niky, ian, 30, 3)
        expect(Meal.all.length).to eq(2)
        c = Meal.new(niky, ian, 20, 3)
        expect(Meal.all.length).to eq(3)
        expect(Meal.all).to eq([a,b,c])
      end
    end
  end
end
