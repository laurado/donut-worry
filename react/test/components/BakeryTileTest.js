import BakeryTile from '../../src/components/BakeryTile';

describe('BakeryTile displays info', () => {
    let name,
        address,
        city,
        state,
        zip,
        description,
        wrapper;

        beforeEach(() => {
          wrapper = mount(
            <BakeryTile
              name='Union Square Donuts'
              address='20 Bow Street'
              city='Somerville'
              state='MA'
              zip='02143'
              description="Jackie is my Mom."
            />
          );
        });

  it('should render an h3 tag', () => {
    expect(wrapper.find('h3')).toBePresent();
    expect(wrapper.find('h3').text()).toBe('Union Square Donuts');
  })

  it('should render an h4 tag with the address', () => {
    expect(wrapper.find('h4')).toBePresent();
    expect(wrapper.find('h4').text()).toBe('20 Bow Street, Somerville, MA 02143');
  });
  it('should render an p tag with the description', () => {
    expect(wrapper.find('p')).toBePresent();
    expect(wrapper.find('p').text()).toBe('Jackie is my Mom.');
  });
});
