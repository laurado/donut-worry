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

  it('should render an h3 tag', () => {
    expect(wrapper.find('h3')).toBePresent();
    expect(wrapper.find('h3').text()).toBe('5: Any old string.');
  })

  it('should render an h4 tag with the vote count', () => {
    expect(wrapper.find('h4')).toBePresent();
    expect(wrapper.find('h4').text()).toBe('36');
  });
});
