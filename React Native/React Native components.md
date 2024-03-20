# Settings screen

![[Pasted image 20240321001600.png|300]]

```jsx
import React, { useState } from 'react';
import {
  StyleSheet,
  SafeAreaView,
  View,
  ScrollView,
  Text,
  TouchableOpacity,
  Switch,
  Image,
} from 'react-native';
import FeatherIcon from 'react-native-vector-icons/Feather';

export default function Example() {
  const [form, setForm] = useState({
    darkMode: false,
    emailNotifications: true,
    pushNotifications: false,
  });

  return (
    <SafeAreaView style={{ flex: 1, backgroundColor: '#f6f6f6' }}>
      <View style={styles.container}>
        <View style={styles.header}>
          <Text style={styles.title}>Settings</Text>

          <Text style={styles.subtitle}>
            Lorem ipsum dolor sit amet consectetur.
          </Text>
        </View>

        <ScrollView>
          <View style={styles.profile}>
            <Image
              alt=""
              source={{
                uri: 'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=facearea&facepad=2.5&w=256&h=256&q=80',
              }}
              style={styles.profileAvatar} />

            <Text style={styles.profileName}>John Doe</Text>

            <Text style={styles.profileEmail}>john.doe@mail.com</Text>

            <TouchableOpacity
              onPress={() => {
                // handle onPress
              }}>
              <View style={styles.profileAction}>
                <Text style={styles.profileActionText}>Edit Profile</Text>

                <FeatherIcon color="#fff" name="edit" size={16} />
              </View>
            </TouchableOpacity>
          </View>

          <View style={styles.section}>
            <Text style={styles.sectionTitle}>Preferences</Text>

            <View style={styles.sectionBody}>
              <View style={[styles.rowWrapper, styles.rowFirst]}>
                <TouchableOpacity
                  onPress={() => {
                    // handle onPress
                  }}
                  style={styles.row}>
                  <View
                    style={[styles.rowIcon, { backgroundColor: '#fe9400' }]}>
                    <FeatherIcon
                      color="#fff"
                      name="globe"
                      size={20} />
                  </View>

                  <Text style={styles.rowLabel}>Language</Text>

                  <View style={styles.rowSpacer} />

                  <Text style={styles.rowValue}>English</Text>

                  <FeatherIcon
                    color="#C6C6C6"
                    name="chevron-right"
                    size={20} />
                </TouchableOpacity>
              </View>

              <View style={styles.rowWrapper}>
                <View style={styles.row}>
                  <View
                    style={[styles.rowIcon, { backgroundColor: '#007AFF' }]}>
                    <FeatherIcon
                      color="#fff"
                      name="moon"
                      size={20} />
                  </View>

                  <Text style={styles.rowLabel}>Dark Mode</Text>

                  <View style={styles.rowSpacer} />

                  <Switch
                    onValueChange={darkMode => setForm({ ...form, darkMode })}
                    value={form.darkMode} />
                </View>
              </View>

              <View style={styles.rowWrapper}>
                <TouchableOpacity
                  onPress={() => {
                    // handle onPress
                  }}
                  style={styles.row}>
                  <View
                    style={[styles.rowIcon, { backgroundColor: '#32c759' }]}>
                    <FeatherIcon
                      color="#fff"
                      name="navigation"
                      size={20} />
                  </View>

                  <Text style={styles.rowLabel}>Location</Text>

                  <View style={styles.rowSpacer} />

                  <Text style={styles.rowValue}>Los Angeles, CA</Text>

                  <FeatherIcon
                    color="#C6C6C6"
                    name="chevron-right"
                    size={20} />
                </TouchableOpacity>
              </View>
            </View>

            <View style={styles.section}>
              <Text style={styles.sectionTitle}>Notifications</Text>

              <View style={styles.sectionBody}>
                <View style={[styles.rowWrapper, styles.rowFirst]}>
                  <View style={styles.row}>
                    <View
                      style={[styles.rowIcon, { backgroundColor: '#38C959' }]}>
                      <FeatherIcon
                        color="#fff"
                        name="at-sign"
                        size={20} />
                    </View>

                    <Text style={styles.rowLabel}>Email Notifications</Text>

                    <View style={styles.rowSpacer} />

                    <Switch
                      onValueChange={emailNotifications =>
                        setForm({ ...form, emailNotifications })
                      }
                      value={form.emailNotifications} />
                  </View>
                </View>

                <View style={styles.rowWrapper}>
                  <View style={styles.row}>
                    <View
                      style={[styles.rowIcon, { backgroundColor: '#38C959' }]}>
                      <FeatherIcon
                        color="#fff"
                        name="bell"
                        size={20} />
                    </View>

                    <Text style={styles.rowLabel}>Push Notifications</Text>

                    <View style={styles.rowSpacer} />

                    <Switch
                      onValueChange={pushNotifications =>
                        setForm({ ...form, pushNotifications })
                      }
                      value={form.pushNotifications} />
                  </View>
                </View>

                <View style={styles.rowWrapper}>
                  <TouchableOpacity
                    onPress={() => {
                      // handle onPress
                    }}
                    style={styles.row}>
                    <View
                      style={[styles.rowIcon, { backgroundColor: '#FE3C30' }]}>
                      <FeatherIcon
                        color="#fff"
                        name="music"
                        size={20} />
                    </View>

                    <Text style={styles.rowLabel}>Sound</Text>

                    <View style={styles.rowSpacer} />

                    <Text style={styles.rowValue}>Default</Text>

                    <FeatherIcon
                      color="#C6C6C6"
                      name="chevron-right"
                      size={20} />
                  </TouchableOpacity>
                </View>
              </View>
            </View>
          </View>

          <Text style={styles.contentFooter}>Made with ❤️ in Seattle</Text>
        </ScrollView>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    paddingVertical: 24,
    paddingHorizontal: 0,
    flexGrow: 1,
    flexShrink: 1,
    flexBasis: 0,
  },
  header: {
    paddingLeft: 24,
    paddingRight: 24,
    marginBottom: 12,
  },
  title: {
    fontSize: 32,
    fontWeight: '700',
    color: '#1d1d1d',
    marginBottom: 6,
  },
  subtitle: {
    fontSize: 15,
    fontWeight: '500',
    color: '#929292',
  },
  contentFooter: {
    marginTop: 24,
    fontSize: 13,
    fontWeight: '500',
    color: '#929292',
    textAlign: 'center',
  },
  /** Profile */
  profile: {
    padding: 16,
    flexDirection: 'column',
    alignItems: 'center',
    backgroundColor: '#fff',
    borderTopWidth: 1,
    borderBottomWidth: 1,
    borderColor: '#e3e3e3',
  },
  profileAvatar: {
    width: 60,
    height: 60,
    borderRadius: 9999,
  },
  profileName: {
    marginTop: 12,
    fontSize: 20,
    fontWeight: '600',
    color: '#090909',
  },
  profileEmail: {
    marginTop: 6,
    fontSize: 16,
    fontWeight: '400',
    color: '#848484',
  },
  profileAction: {
    marginTop: 12,
    paddingVertical: 10,
    paddingHorizontal: 16,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#007bff',
    borderRadius: 12,
  },
  profileActionText: {
    marginRight: 8,
    fontSize: 15,
    fontWeight: '600',
    color: '#fff',
  },
  /** Section */
  section: {
    paddingTop: 12,
  },
  sectionTitle: {
    marginVertical: 8,
    marginHorizontal: 24,
    fontSize: 14,
    fontWeight: '600',
    color: '#a7a7a7',
    textTransform: 'uppercase',
    letterSpacing: 1.2,
  },
  sectionBody: {
    paddingLeft: 24,
    backgroundColor: '#fff',
    borderTopWidth: 1,
    borderBottomWidth: 1,
    borderColor: '#e3e3e3',
  },
  /** Row */
  row: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'flex-start',
    paddingRight: 16,
    height: 50,
  },
  rowWrapper: {
    borderTopWidth: 1,
    borderColor: '#e3e3e3',
  },
  rowFirst: {
    borderTopWidth: 0,
  },
  rowIcon: {
    width: 30,
    height: 30,
    borderRadius: 4,
    alignItems: 'center',
    justifyContent: 'center',
    marginRight: 12,
  },
  rowLabel: {
    fontSize: 17,
    fontWeight: '500',
    color: '#000',
  },
  rowSpacer: {
    flexGrow: 1,
    flexShrink: 1,
    flexBasis: 0,
  },
  rowValue: {
    fontSize: 17,
    fontWeight: '500',
    color: '#8B8B8B',
    marginRight: 4,
  },
});
```

# Specification page

![[Pasted image 20240321002600.png|300]]

```jsx
import React from 'react';
import {
  StyleSheet,
  View,
  ScrollView,
  StatusBar,
  SafeAreaView,
  TouchableOpacity,
  Text,
  Image,
} from 'react-native';
import Swiper from 'react-native-swiper';
import FeatherIcon from 'react-native-vector-icons/Feather';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';

const items = [
  [
    { label: 'Model', value: 'P100D' },
    { label: 'Mileage', value: '22k mi' },
  ],
  [
    { label: 'Range', value: '396 mi' },
    { label: 'Top Speed', value: '200 mph' },
  ],
  [
    { label: 'Battery', value: '100kW/h' },
    { label: 'Peak Power', value: '1,020 hp' },
  ],
  [
    { label: '0-60 mph', value: '2.5 seconds' },
    { label: 'Cargo volume', value: '25 ft³' },
  ],
];
const IMAGES = [
  'https://images.unsplash.com/photo-1617704548623-340376564e68?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8dGVzbGElMjBtb2RlbCUyMHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
  'https://images.unsplash.com/photo-1639358336404-b847ac2a3272?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80',
  'https://images.unsplash.com/photo-1652509525608-6b44097ea5a7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjN8fHRlc2xhJTIwbW9kZWwlMjBzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
];

export default function Example() {
  return (
    <View style={{ flex: 1 }}>
      <StatusBar barStyle="dark-content" />

      <SafeAreaView style={{ flex: 1, backgroundColor: '#fff' }}>
        <View style={styles.container}>
          <View style={styles.header}>
            <View style={styles.headerAction}>
              <TouchableOpacity
                onPress={() => {
                  // handle onPress
                }}>
                <FeatherIcon
                  color="#000"
                  name="arrow-left"
                  size={24} />
              </TouchableOpacity>
            </View>

            <Text style={styles.headerTitle}>Tesla Model S</Text>

            <View style={[styles.headerAction, { alignItems: 'flex-end' }]}>
              <TouchableOpacity
                onPress={() => {
                  // handle onPress
                }}>
                <FeatherIcon
                  color="#000"
                  name="more-vertical"
                  size={24} />
              </TouchableOpacity>
            </View>
          </View>

          <ScrollView contentContainerStyle={{ paddingBottom: 100 }}>
            <View style={styles.photos}>
              <View style={styles.photosTop}>
                <TouchableOpacity
                  onPress={() => {
                    // handle onPress
                  }}
                  style={styles.photosTopItem}>
                  <FeatherIcon color="#000" name="star" size={18} />
                </TouchableOpacity>

                <TouchableOpacity
                  onPress={() => {
                    // handle onPress
                  }}
                  style={styles.photosTopItem}>
                  <FeatherIcon
                    color="#000"
                    name="share"
                    size={16} />
                </TouchableOpacity>
              </View>

              <Swiper
                renderPagination={(index, total) => (
                  <View style={styles.photosPagination}>
                    <Text style={styles.photosPaginationText}>
                      {index + 1} of {total}
                    </Text>
                  </View>
                )}>
                {IMAGES.map((src, index) => (
                  <Image
                    alt=""
                    key={index}
                    source={{ uri: src }}
                    style={styles.photosImg} />
                ))}
              </Swiper>
            </View>

            <TouchableOpacity
              onPress={() => {
                // handle onPress
              }}
              style={styles.picker}>
              <FeatherIcon color="#000" name="calendar" size={18} />

              <View style={styles.pickerDates}>
                <Text style={[styles.pickerDatesText, { marginBottom: 2 }]}>
                  Thu, Feb 23 at 10:00 AM
                </Text>

                <Text style={styles.pickerDatesText}>
                  Sun, Feb 26 at 10:00 AM
                </Text>
              </View>

              <View style={styles.pickerAction}>
                <Text style={styles.pickerActionText}>Change</Text>

                <FeatherIcon
                  color="#4C6CFD"
                  name="chevron-right"
                  size={18} />
              </View>
            </TouchableOpacity>
            <View style={styles.info}>
              <Text style={styles.infoTitle}>Tesla Model S 2022</Text>

              <View style={styles.infoRating}>
                <Text style={styles.infoRatingLabel}>5.0</Text>

                <FeatherIcon
                  color="#4c6cfd"
                  name="star"
                  size={15} />

                <Text style={styles.infoRatingText}>(7 ratings)</Text>
              </View>

              <Text style={styles.infoDescription}>
                Model S Dual Motor All-Wheel Drive unlocks more range than any
                other vehicle in our current lineup, with insane power and
                maximum control.
              </Text>
            </View>
            <View style={styles.stats}>
              {items.map((row, rowIndex) => (
                <View
                  key={rowIndex}
                  style={[
                    styles.statsRow,
                    rowIndex === 0 && { borderTopWidth: 0 },
                  ]}>
                  {row.map(({ label, value }, index) => (
                    <View
                      key={index}
                      style={[
                        styles.statsItem,
                        index === 0 && { borderLeftWidth: 0 },
                      ]}>
                      <Text style={styles.statsItemText}>{label}</Text>

                      <Text style={styles.statsItemValue}>{value}</Text>
                    </View>
                  ))}
                </View>
              ))}
            </View>
          </ScrollView>
        </View>
      </SafeAreaView>

      <View style={styles.overlay}>
        <View style={styles.overlayContent}>
          <View style={styles.overlayContentTop}>
            <Text style={styles.overlayContentPriceBefore}>$72</Text>

            <Text style={styles.overlayContentPrice}>$56/day</Text>
          </View>

          <Text style={styles.overlayContentTotal}>$134 est. total</Text>
        </View>

        <TouchableOpacity
          onPress={() => {
            // handle onPress
          }}>
          <View style={styles.btn}>
            <Text style={styles.btnText}>Continue</Text>

            <MaterialCommunityIcons
              color="#fff"
              name="arrow-right-circle"
              size={18}
              style={{ marginLeft: 12 }} />
          </View>
        </TouchableOpacity>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    paddingVertical: 0,
    paddingHorizontal: 16,
    flexGrow: 1,
    flexShrink: 1,
    flexBasis: 0,
  },
  /** Header */
  header: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
  },
  headerAction: {
    width: 40,
    height: 40,
    alignItems: 'flex-start',
    justifyContent: 'center',
  },
  headerTitle: {
    fontSize: 19,
    fontWeight: '600',
    color: '#000',
  },
  /** Photos */
  photos: {
    marginTop: 12,
    position: 'relative',
    height: 240,
    overflow: 'hidden',
    borderRadius: 12,
  },
  photosTop: {
    position: 'absolute',
    top: 0,
    left: 0,
    right: 0,
    zIndex: 2,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingVertical: 12,
    paddingHorizontal: 16,
  },
  photosTopItem: {
    width: 40,
    height: 40,
    borderRadius: 9999,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 1,
    },
    shadowOpacity: 0.22,
    shadowRadius: 2.22,
    elevation: 3,
  },
  photosPagination: {
    position: 'absolute',
    bottom: 12,
    right: 12,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'flex-end',
    paddingVertical: 6,
    paddingHorizontal: 12,
    backgroundColor: '#000',
    borderRadius: 12,
  },
  photosPaginationText: {
    fontWeight: '600',
    fontSize: 14,
    color: '#fbfbfb',
  },
  photosImg: {
    flexGrow: 1,
    flexShrink: 1,
    flexBasis: 0,
    width: '100%',
    height: 240,
  },
  /** Picker */
  picker: {
    marginTop: 12,
    paddingVertical: 14,
    paddingHorizontal: 20,
    borderRadius: 20,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#fff',
    borderWidth: 1,
    borderColor: '#f5f5f5',
  },
  pickerDates: {
    marginLeft: 12,
  },
  pickerDatesText: {
    fontSize: 13,
    fontWeight: '500',
  },
  pickerAction: {
    marginLeft: 'auto',
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
  },
  pickerActionText: {
    fontSize: 16,
    lineHeight: 21,
    fontWeight: '600',
    color: '#4c6cfd',
  },
  /** Info */
  info: {
    marginTop: 12,
    backgroundColor: '#f5f5f5',
    paddingVertical: 16,
    paddingHorizontal: 20,
    borderRadius: 20,
  },
  infoTitle: {
    fontSize: 20,
    lineHeight: 25,
    fontWeight: '600',
    letterSpacing: 0.38,
    color: '#000000',
    marginBottom: 6,
  },
  infoRating: {
    marginBottom: 12,
    flexDirection: 'row',
    alignItems: 'center',
  },
  infoRatingLabel: {
    fontSize: 13,
    fontWeight: 'bold',
    color: '#000',
    marginRight: 2,
  },
  infoRatingText: {
    fontSize: 12,
    fontWeight: '600',
    color: '#8e8e93',
    marginLeft: 2,
  },
  infoDescription: {
    fontWeight: '400',
    fontSize: 13,
    lineHeight: 18,
    letterSpacing: -0.078,
    color: '#8e8e93',
  },
  /** Stats */
  stats: {
    marginTop: 12,
    backgroundColor: '#fff',
    borderRadius: 20,
    overflow: 'hidden',
  },
  statsRow: {
    flexDirection: 'row',
    backgroundColor: '#f5f5f5',
    borderTopWidth: 1,
    borderColor: '#fff',
  },
  statsItem: {
    flexGrow: 2,
    flexShrink: 1,
    flexBasis: 0,
    paddingVertical: 12,
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center',
    borderLeftWidth: 1,
    borderColor: '#fff',
  },
  statsItemText: {
    fontSize: 13,
    fontWeight: '400',
    lineHeight: 18,
    color: '#8e8e93',
    marginBottom: 4,
  },
  statsItemValue: {
    fontSize: 16,
    fontWeight: '600',
    lineHeight: 20,
    color: '#000',
  },
  /** Overlay */
  overlay: {
    position: 'absolute',
    bottom: 0,
    left: 0,
    right: 0,
    backgroundColor: '#fff',
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    paddingTop: 12,
    paddingHorizontal: 16,
    paddingBottom: 48,
    shadowColor: '#000',
    shadowOffset: {
      width: 0,
      height: 1,
    },
    shadowOpacity: 0.22,
    shadowRadius: 2.22,
    elevation: 3,
  },
  overlayContent: {
    flexDirection: 'column',
    alignItems: 'flex-start',
  },
  overlayContentTop: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'flex-start',
    marginBottom: 2,
  },
  overlayContentPriceBefore: {
    fontSize: 16,
    lineHeight: 21,
    fontWeight: '600',
    color: '#8e8e93',
    marginRight: 4,
    textDecorationLine: 'line-through',
    textDecorationColor: '#8e8e93',
    textDecorationStyle: 'solid',
  },
  overlayContentPrice: {
    fontSize: 21,
    lineHeight: 26,
    fontWeight: '700',
    color: '#000',
  },
  overlayContentTotal: {
    fontSize: 13,
    lineHeight: 18,
    fontWeight: '600',
    color: '#4c6cfd',
    letterSpacing: -0.07,
    textDecorationLine: 'underline',
    textDecorationColor: '#4c6cfd',
    textDecorationStyle: 'solid',
  },
  /** Button */
  btn: {
    paddingVertical: 10,
    paddingHorizontal: 20,
    borderRadius: 8,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    borderWidth: 1,
    backgroundColor: '#007aff',
    borderColor: '#007aff',
  },
  btnText: {
    fontSize: 18,
    lineHeight: 26,
    fontWeight: '600',
    color: '#fff',
  },
});
```

# Bottom Action sheet

![[Pasted image 20240321003054.png|300]]

```jsx
import React from 'react';
import {
  StyleSheet,
  SafeAreaView,
  View,
  Text,
  TouchableOpacity,
} from 'react-native';
import RBSheet from 'react-native-raw-bottom-sheet';

export default function Example() {
  const sheet = React.useRef();

  React.useEffect(() => {
    sheet.current.open();
  }, []);

  return (
    <SafeAreaView style={{ flex: 1 }}>
      <View style={styles.placeholder}>
        <View style={styles.placeholderInset}>
          {/* Replace with your content */}
        </View>
      </View>

      <RBSheet
        customStyles={{ container: styles.sheet }}
        height={300}
        openDuration={250}
        ref={sheet}>
        <View style={styles.header}>
          <Text style={styles.headerTitle}>Danger Zone</Text>
        </View>

        <View style={styles.body}>
          <Text style={styles.bodyText}>
            Are you sure you want to
            <Text style={{ fontWeight: '600' }}> delete your profile</Text>?
            {'\n'}
            You won't be able to revert this action.
          </Text>

          <TouchableOpacity
            onPress={() => {
              // handle onPress
            }}>
            <View style={styles.btn}>
              <Text style={styles.btnText}>Delete anyway</Text>
            </View>
          </TouchableOpacity>

          <View style={styles.bodyGap} />

          <TouchableOpacity
            onPress={() => {
              // handle onPress
            }}>
            <View style={styles.btnSecondary}>
              <Text style={styles.btnSecondaryText}>Cancel</Text>
            </View>
          </TouchableOpacity>
        </View>
      </RBSheet>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  sheet: {
    borderTopLeftRadius: 14,
    borderTopRightRadius: 14,
  },
  /** Placeholder */
  placeholder: {
    flexGrow: 1,
    flexShrink: 1,
    flexBasis: 0,
    height: 400,
    marginTop: 0,
    padding: 24,
    backgroundColor: 'transparent',
  },
  placeholderInset: {
    borderWidth: 4,
    borderColor: '#e5e7eb',
    borderStyle: 'dashed',
    borderRadius: 9,
    flexGrow: 1,
    flexShrink: 1,
    flexBasis: 0,
  },
  /** Header */
  header: {
    borderBottomWidth: 1,
    borderColor: '#efefef',
    padding: 16,
  },
  headerTitle: {
    fontSize: 20,
    fontWeight: '600',
    textAlign: 'center',
  },
  /** Body */
  body: {
    padding: 24,
  },
  bodyText: {
    fontSize: 16,
    lineHeight: 24,
    fontWeight: '400',
    color: '#0e0e0e',
    marginBottom: 24,
    textAlign: 'center',
  },
  bodyGap: {
    marginBottom: 12,
  },
  /** Button */
  btn: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    borderRadius: 8,
    paddingVertical: 8,
    paddingHorizontal: 16,
    borderWidth: 1,
    backgroundColor: '#ff3c2f',
    borderColor: '#ff3c2f',
  },
  btnText: {
    fontSize: 17,
    lineHeight: 24,
    fontWeight: '600',
    color: '#fff',
  },
  btnSecondary: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    borderRadius: 8,
    paddingVertical: 8,
    paddingHorizontal: 16,
    borderWidth: 1,
    backgroundColor: 'transparent',
    borderColor: '#dddce0',
  },
  btnSecondaryText: {
    fontSize: 17,
    lineHeight: 24,
    fontWeight: '600',
    color: '#000',
  },
});
```

# Sign In Form

![[Pasted image 20240321004835.png|300]]

```jsx
import React, { useState } from 'react';
import {
  StyleSheet,
  SafeAreaView,
  View,
  Image,
  Text,
  TouchableOpacity,
  TextInput,
} from 'react-native';
import { KeyboardAwareScrollView } from 'react-native-keyboard-aware-scroll-view';

export default function Example() {
  const [form, setForm] = useState({
    email: '',
    password: '',
  });
  return (
    <SafeAreaView style={{ flex: 1, backgroundColor: '#e8ecf4' }}>
      <View style={styles.container}>
        <KeyboardAwareScrollView>
          <View style={styles.header}>
            <Image
              alt="App Logo"
              resizeMode="contain"
              style={styles.headerImg}
              source={{
                uri: 'https://assets.withfra.me/SignIn.2.png',
              }} />

            <Text style={styles.title}>
              Sign in to <Text style={{ color: '#075eec' }}>MyApp</Text>
            </Text>

            <Text style={styles.subtitle}>
              Get access to your portfolio and more
            </Text>
          </View>

          <View style={styles.form}>
            <View style={styles.input}>
              <Text style={styles.inputLabel}>Email address</Text>

              <TextInput
                autoCapitalize="none"
                autoCorrect={false}
                keyboardType="email-address"
                onChangeText={email => setForm({ ...form, email })}
                placeholder="john@example.com"
                placeholderTextColor="#6b7280"
                style={styles.inputControl}
                value={form.email} />
            </View>

            <View style={styles.input}>
              <Text style={styles.inputLabel}>Password</Text>

              <TextInput
                autoCorrect={false}
                onChangeText={password => setForm({ ...form, password })}
                placeholder="********"
                placeholderTextColor="#6b7280"
                style={styles.inputControl}
                secureTextEntry={true}
                value={form.password} />
            </View>

            <View style={styles.formAction}>
              <TouchableOpacity
                onPress={() => {
                  // handle onPress
                }}>
                <View style={styles.btn}>
                  <Text style={styles.btnText}>Sign in</Text>
                </View>
              </TouchableOpacity>
            </View>

            <Text style={styles.formLink}>Forgot password?</Text>
          </View>
        </KeyboardAwareScrollView>

        <TouchableOpacity
          onPress={() => {
            // handle link
          }}
          style={{ marginTop: 'auto' }}>
          <Text style={styles.formFooter}>
            Don't have an account?{' '}
            <Text style={{ textDecorationLine: 'underline' }}>Sign up</Text>
          </Text>
        </TouchableOpacity>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    paddingVertical: 24,
    paddingHorizontal: 0,
    flexGrow: 1,
    flexShrink: 1,
    flexBasis: 0,
  },
  title: {
    fontSize: 31,
    fontWeight: '700',
    color: '#1D2A32',
    marginBottom: 6,
  },
  subtitle: {
    fontSize: 15,
    fontWeight: '500',
    color: '#929292',
  },
  /** Header */
  header: {
    alignItems: 'center',
    justifyContent: 'center',
    marginVertical: 36,
  },
  headerImg: {
    width: 80,
    height: 80,
    alignSelf: 'center',
    marginBottom: 36,
  },
  /** Form */
  form: {
    marginBottom: 24,
    paddingHorizontal: 24,
    flexGrow: 1,
    flexShrink: 1,
    flexBasis: 0,
  },
  formAction: {
    marginTop: 4,
    marginBottom: 16,
  },
  formLink: {
    fontSize: 16,
    fontWeight: '600',
    color: '#075eec',
    textAlign: 'center',
  },
  formFooter: {
    fontSize: 15,
    fontWeight: '600',
    color: '#222',
    textAlign: 'center',
    letterSpacing: 0.15,
  },
  /** Input */
  input: {
    marginBottom: 16,
  },
  inputLabel: {
    fontSize: 17,
    fontWeight: '600',
    color: '#222',
    marginBottom: 8,
  },
  inputControl: {
    height: 50,
    backgroundColor: '#fff',
    paddingHorizontal: 16,
    borderRadius: 12,
    fontSize: 15,
    fontWeight: '500',
    color: '#222',
    borderWidth: 1,
    borderColor: '#C9D3DB',
    borderStyle: 'solid',
  },
  /** Button */
  btn: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'center',
    borderRadius: 30,
    paddingVertical: 10,
    paddingHorizontal: 20,
    borderWidth: 1,
    backgroundColor: '#075eec',
    borderColor: '#075eec',
  },
  btnText: {
    fontSize: 18,
    lineHeight: 26,
    fontWeight: '600',
    color: '#fff',
  },
});
```
