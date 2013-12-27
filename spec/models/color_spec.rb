require 'spec_helper'

describe Color do

  it "is invalid without hue" do
    color = Color.create(sat: 90, val: 10).should be_invalid
  end

  it "is invalid without sat" do
    color = Color.create(hue:10, val: 10).should be_invalid
  end

  it "is invalid without val" do
    color = Color.create(sat: 90, hue: 10).should be_invalid
  end

  it "sets r,g,b with hsv" do
    color = Color.create(hue: 180, sat: 50, val: 50)
    color.hsv_to_rgb!
    color.r.should == 64
    color.g.should == 128
    color.b.should == 128
  end

  it "sets hex with rgb" do
    color = Color.create(r: 255, g: 0, b: 0)
    color.rgb_to_hex!
    color.hex.should == "#ff0000"
  end

  describe "validations" do
    subject do
      Color.create(hue: 100, sat: 90, val: 10)
    end

    it { should validate_numericality_of(:hue) }
    it { should_not allow_value(-1).for(:hue) }
    it { should_not allow_value(361).for(:hue) }
    it { should allow_value(50).for(:hue) }

    it { should validate_numericality_of(:sat) }
    it { should_not allow_value(-1).for(:sat) }
    it { should_not allow_value(101).for(:sat) }
    it { should allow_value(50).for(:sat) }

    it { should validate_numericality_of(:val) }
    it { should_not allow_value(-1).for(:val) }
    it { should_not allow_value(101).for(:val) }
    it { should allow_value(50).for(:val) }

    it { should validate_numericality_of(:r) }
    it { should_not allow_value(-1).for(:r) }
    it { should_not allow_value(256).for(:r) }
    it { should allow_value(50).for(:r) }

    it { should validate_numericality_of(:g) }
    it { should_not allow_value(-1).for(:g) }
    it { should_not allow_value(256).for(:g) }
    it { should allow_value(50).for(:g) }

    it { should validate_numericality_of(:b) }
    it { should_not allow_value(-1).for(:b) }
    it { should_not allow_value(256).for(:b) }
    it { should allow_value(50).for(:b) }
  end


end

