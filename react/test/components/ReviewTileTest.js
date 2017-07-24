import ReviewTile from '../../src/components/ReviewTile';

describe('ReviewTile displays info', () => {
    let rating,
        description,
        votes,
        wrapper;

        beforeEach(() => {
          wrapper = mount(
            <ReviewTile
              rating={5}
              votes={36}
              description="Any old string."
            />
          );
        });

  it('should render 3 h5 tags', () => {
    expect(wrapper.find('h5').length).toBe(3);
  })

  it('should render the description', () => {
    expect(wrapper.text()).toMatch('Any old string')
  })

  it('should render the rating', () => {
    expect(wrapper.text()).toMatch('Rating: 5')
  })

  it('should render the votes', () => {
    expect(wrapper.text()).toMatch('Votes: 36')
  })


});
