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

  it('should render an h5 tag', () => {
    expect(wrapper.find('h5')).toBePresent();
    expect(wrapper.find('h5').text()).toBe('Rating: 5');
  })

  it('should render an h5 tag with the description', () => {
    expect(wrapper.find('h5')).toBePresent();
    expect(wrapper.find('h5').text()).toBe('Description: Any old string.');
  });

  it('should render an h5 tag with the vote count', () => {
    expect(wrapper.find('h5')).toBePresent();
    expect(wrapper.find('h5').text()).toBe('Votes: 36');
  });
});
