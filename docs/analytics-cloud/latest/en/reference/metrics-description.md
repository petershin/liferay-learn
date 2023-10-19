---
uuid: 5dd686af-6ef7-43f3-960e-7630d26ded8a
---
# Metrics Description

See the description of various metrics used by Analytics Cloud and the way they are calculated.

Index:
- [%](./metrics-description.md#%)
- [A](./metrics-description.md#a)
- [B](./metrics-description.md#b)
- [C](./metrics-description.md#c)
- [D](./metrics-description.md#d)
- [E](./metrics-description.md#e)
- [I](./metrics-description.md#i)
- [K](./metrics-description.md#k)
- [P](./metrics-description.md#p)
- [R](./metrics-description.md#r)
- [S](./metrics-description.md#s)
- [T](./metrics-description.md#t)
- [U](./metrics-description.md#u)
- [V](./metrics-description.md#v)

## %

### % of Active Members for Interests

**Description:** Calculates the number of members of a segment that were interested in a topic for the last thirty days.

**How it's calculated:** The number of segment members interested in a topic (not including the current day) ÷ the total number of active members in the segment * 100

**Found in:** segments.

### % of Sessions for Acquisitions 

**Description:** Calculates where unique users visiting your site came from. This information is presented in three levels: channels, source/medium, and referrers.

**How it's calculated:** Number of sessions by an acquisition ÷ total number of sessions * 100

**Found in:** sites

### % of Sessions for Interest s

**Description:** Calculates how many sessions had that interest in a given time range.

**How it's calculated:** Number of sessions during the selected date range with that interest topic ÷ total number of sessions during the selected date range * 100

**Found in:** sites
  
### % of Total Individuals for Interests
  
**Description:** Calculates the number of individuals that were interested in a topic in the last 30 days.

**How it's calculated:** The number of individuals interested in a topic (not including the current day) ÷ total number of individuals * 100

**Found in:** individuals

## A

### Abandonment

**Description:** Calculates the percentage of users who left a form or custom asset without submitting. 

**How it's calculated:** (Total number of times a form or asset was viewed - total number of times the asset was submitted) ÷ total number of times the form or asset was viewed * 100

**Found in:** forms and custom assets

### Active Individuals

**Description:** A user who interacted with the site in a given time range.

**How it's calculated:** The total number of unique users who interacted with the site in a given time range.

**Found in:** individuals

### Anonymous Individuals

**Description:** A user who's email address is not known (i.e. does not match with any synced contacts). 

**How it's calculated:** The total number of users who are not known by Analytics Cloud.

**Found in:** individuals

### Audience Report - Views

**Description:** Calculates the anonymous and known individuals who interact with the page or asset.

**How it's calculated:** The total number of anonymous and known individuals who interacted with the page or asset. The percentage is calculated by the number of known individuals ÷ the total number of unique visitors.

**Found in:** blogs, site pages, web content, 

### Audience Report - Segmented Views

**Description:** Calculates the percentage of known individuals that are in a segment who interact with a page or asset.

**How it's calculated:**

**Found in:**

### Audience Report - Viewer Segments

**Description:**

**How it's calculated:**

**Found in:**

Audience Report Metrics 


Total # of known individuals*: unique_visitor_1 which fired that primary asset event or viewed that page + unique_visitor_2 which fired that primary asset event or viewed that page + ...
Percentage: total # of known individuals / total # of unique_visitors who fired that asset primary event or viewed that page * 100
*counts userIds associated with emails
Total # of anonymous individuals*: unique_visitor_3 which fired that primary asset event or viewed that page + unique_visitor_5 which fired that primary asset event or viewed that page + ...
Percentage: total # of anonymous individuals / total # of unique_visitors who fired that asset primary event or viewed that page * 100
*counts userIds not associated with emails
How it's calculated for segmented / not segmented individuals:
Total # of segmented known individuals: unique_visitor_1 which fired that primary asset event or viewed that page and belongs to any segment + unique_visitor_2 which fired that primary asset event or viewed that page and belongs to any segment + ...
Percentage: total # of segmented known individuals / total # of known individuals that fired that asset primary event or viewed that page * 100
Total # of not segmented known individuals: unique_visitor_3 which fired that primary asset event or viewed that page and does not belong to any segment + unique_visitor_4 which fired that primary asset event or viewed that page and does not belong to any segment + ...
Percentage: total # of not segmented known individuals / total # of known individuals that fired that asset primary event or viewed that page * 100
How it's calculated for audience segments with individual:
Total # for a segment in the top 5: unique_visitor_1 which fired that primary asset event or viewed that page and belongs to segment_A + unique_visitor_2 which fired that primary asset event or viewed that page and belongs to segment_A + ...
Percentage: total # for a segment in the top 5 / total # of segmented known individuals that fired that asset primary event or viewed that page * 100
Total # for remaining segments not listed in the top 5 segments: (unique_visitor_5 which fired that primary asset event or viewed that page and belongs to segment_F + unique_visitor_6 which fired that primary asset event or viewed that page and belongs to segment_F + ...) + (unique_visitor_7 which fired that primary asset event or viewed that page and belongs to segment_G + unique_visitor_8 which fired that primary asset event or viewed that page and belongs to segment_G + ...) + ...
Percentage: Total # for remaining segments not listed in the top 5 segments / total # of segmented known individuals that fired that asset primary event or viewed that page * 100
Associated Events:  identity , documentsDownloaded , blogViewed , formSubmitted ,webContentViewed 
It’s Used On: 

 

## B

### asdf

**Description:**

**How it's calculated:**

**Found in:**

## C

### asdf

**Description:**

**How it's calculated:**

**Found in:**

## D

### asdf

**Description:**

**How it's calculated:**

**Found in:**

## E

### asdf

**Description:**

**How it's calculated:**

**Found in:**

## I

### asdf

**Description:**

**How it's calculated:**

**Found in:**

## K

### asdf

**Description:**

**How it's calculated:**

**Found in:**

## P

### asdf

**Description:**

**How it's calculated:**

**Found in:**

## R

### asdf

**Description:**

**How it's calculated:**

**Found in:**

## S

### asdf

**Description:**

**How it's calculated:**

**Found in:**

## T

### asdf

**Description:**

**How it's calculated:**

**Found in:**

## U

### asdf

**Description:**

**How it's calculated:**

**Found in:**

## V

### asdf

**Description:**

**How it's calculated:**

**Found in:**
