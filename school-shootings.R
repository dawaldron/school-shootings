library(here)
library(data.table)
library(magrittr)

getData <- function(varlist, dataYear, geog) {
  require(httr)
  require(jsonlite)
  require(magrittr)
  require(data.table)
  req_url <- paste0('https://api.census.gov/data/', dataYear, '/acs/acs1?get=NAME,', varlist, '&', geog, '&key=5ac41fffeac338e86d11691565b43d053c6a2c59')
  resp_data <- GET(req_url, verbose(TRUE))
  resp <- resp_data %>%
    content(as = 'text')
  dt <- resp %>%
    fromJSON() %>%
    data.table()
  
  setnames(dt, names(dt), t(dt[1]))
  dt <- dt[-1]
  
  dt <- melt(dt, id.var = c('NAME'), variable.factor = FALSE)
  return(dt)
}



# National enrollment by race from ACS 2019
dt_acs <- getData('group(B14007)', 2019, 'for=us:*') %>%
  dcast(NAME ~ variable, value.var = 'value') %>%
  .[,
    .(race = 'All races',
      `-1` = as.numeric(B14007_003E),
      `0`  = as.numeric(B14007_004E),
      `1`  = as.numeric(B14007_005E),
      `2`  = as.numeric(B14007_006E),
      `3`  = as.numeric(B14007_007E),
      `4`  = as.numeric(B14007_008E),
      `5`  = as.numeric(B14007_009E),
      `6`  = as.numeric(B14007_010E),
      `7`  = as.numeric(B14007_011E),
      `8`  = as.numeric(B14007_012E),
      `9`  = as.numeric(B14007_013E),
      `10` = as.numeric(B14007_014E),
      `11` = as.numeric(B14007_015E),
      `12` = as.numeric(B14007_016E))] %>%
  melt(id.var = 'race',
       variable.factor = FALSE,
       variable.name = 'grade',
       value.name = 'acsEnrollment') %>%
  .[, grade := as.numeric(grade)]

dt_acsWhite <- getData('group(B14007H)', 2019, 'for=us:*') %>%
  dcast(NAME ~ variable, value.var = 'value') %>%
  .[,
    .(race = 'White, non-Hispanic',
      `-1` = as.numeric(B14007H_003E),
      `0`  = as.numeric(B14007H_004E),
      `1`  = as.numeric(B14007H_005E),
      `2`  = as.numeric(B14007H_006E),
      `3`  = as.numeric(B14007H_007E),
      `4`  = as.numeric(B14007H_008E),
      `5`  = as.numeric(B14007H_009E),
      `6`  = as.numeric(B14007H_010E),
      `7`  = as.numeric(B14007H_011E),
      `8`  = as.numeric(B14007H_012E),
      `9`  = as.numeric(B14007H_013E),
      `10` = as.numeric(B14007H_014E),
      `11` = as.numeric(B14007H_015E),
      `12` = as.numeric(B14007H_016E))] %>%
  melt(id.var = 'race',
       variable.factor = FALSE,
       variable.name = 'grade',
       value.name = 'acsEnrollment') %>%
  .[, grade := as.numeric(grade)]

dt_acsBlack <- getData('group(B14007B)', 2019, 'for=us:*') %>%
  dcast(NAME ~ variable, value.var = 'value') %>%
  .[,
    .(race = 'Black or African-American',
      `-1` = as.numeric(B14007B_003E),
      `0`  = as.numeric(B14007B_004E),
      `1`  = as.numeric(B14007B_005E),
      `2`  = as.numeric(B14007B_006E),
      `3`  = as.numeric(B14007B_007E),
      `4`  = as.numeric(B14007B_008E),
      `5`  = as.numeric(B14007B_009E),
      `6`  = as.numeric(B14007B_010E),
      `7`  = as.numeric(B14007B_011E),
      `8`  = as.numeric(B14007B_012E),
      `9`  = as.numeric(B14007B_013E),
      `10` = as.numeric(B14007B_014E),
      `11` = as.numeric(B14007B_015E),
      `12` = as.numeric(B14007B_016E))] %>%
  melt(id.var = 'race',
       variable.factor = FALSE,
       variable.name = 'grade',
       value.name = 'acsEnrollment') %>%
  .[, grade := as.numeric(grade)]

dt_acsHispanic <- getData('group(B14007I)', 2019, 'for=us:*') %>%
  dcast(NAME ~ variable, value.var = 'value') %>%
  .[,
    .(race = 'Hispanic or Latino',
      `-1` = as.numeric(B14007I_003E),
      `0`  = as.numeric(B14007I_004E),
      `1`  = as.numeric(B14007I_005E),
      `2`  = as.numeric(B14007I_006E),
      `3`  = as.numeric(B14007I_007E),
      `4`  = as.numeric(B14007I_008E),
      `5`  = as.numeric(B14007I_009E),
      `6`  = as.numeric(B14007I_010E),
      `7`  = as.numeric(B14007I_011E),
      `8`  = as.numeric(B14007I_012E),
      `9`  = as.numeric(B14007I_013E),
      `10` = as.numeric(B14007I_014E),
      `11` = as.numeric(B14007I_015E),
      `12` = as.numeric(B14007I_016E))] %>%
  melt(id.var = 'race',
       variable.factor = FALSE,
       variable.name = 'grade',
       value.name = 'acsEnrollment') %>%
  .[, grade := as.numeric(grade)]

dt_acsAsian <- getData('group(B14007D)', 2019, 'for=us:*') %>%
  dcast(NAME ~ variable, value.var = 'value') %>%
  .[,
    .(race = 'Asian',
      `-1` = as.numeric(B14007D_003E),
      `0`  = as.numeric(B14007D_004E),
      `1`  = as.numeric(B14007D_005E),
      `2`  = as.numeric(B14007D_006E),
      `3`  = as.numeric(B14007D_007E),
      `4`  = as.numeric(B14007D_008E),
      `5`  = as.numeric(B14007D_009E),
      `6`  = as.numeric(B14007D_010E),
      `7`  = as.numeric(B14007D_011E),
      `8`  = as.numeric(B14007D_012E),
      `9`  = as.numeric(B14007D_013E),
      `10` = as.numeric(B14007D_014E),
      `11` = as.numeric(B14007D_015E),
      `12` = as.numeric(B14007D_016E))] %>%
  melt(id.var = 'race',
       variable.factor = FALSE,
       variable.name = 'grade',
       value.name = 'acsEnrollment') %>%
  .[, grade := as.numeric(grade)]

dt_acs <- dt_acs %>%
  rbind(dt_acsWhite) %>%
  rbind(dt_acsBlack) %>%
  rbind(dt_acsHispanic) %>%
  rbind(dt_acsAsian)


dt_wapo <- fread('https://github.com/washingtonpost/data-school-shootings/raw/master/school-shootings-data.csv')

dt_wapo[casualties > 0, .(shootingEnrollment = sum(enrollment)), .(school_year, shooting_type)] %>%
  dcast(school_year ~ shooting_type, value.var = 'shootingEnrollment')

dt_wapo[low_grade == 'PK', low_grade := '-1']
dt_wapo[low_grade == 'KG', low_grade := '0']
dt_wapo[, low_grade := as.numeric(low_grade)]

dt_wapo[high_grade == 'PK', high_grade := '-1']
dt_wapo[high_grade == 'KG', high_grade := '0']
dt_wapo[, high_grade := as.numeric(high_grade)]

dt_wapo[, gradeCount := high_grade - low_grade + 1]

dt_wapo <- dt_wapo[!is.na(low_grade) & !is.na(high_grade)]

dt_wapo[, .(.N, median(enrollment), sum(enrollment)), year]

getGrade <- function(grade, data) {
  dt <- data %>%
    .[low_grade <= grade
      & high_grade >= grade,
      .(grade = grade,
        number = .N,
        'All races' = sum(enrollment / gradeCount, na.rm = TRUE),
        'White, non-Hispanic' = sum(white / gradeCount, na.rm = TRUE),
        'Black or African-American' = sum(black / gradeCount, na.rm = TRUE),
        'Hispanic or Latino' = sum(hispanic / gradeCount, na.rm = TRUE),
        'Asian' = sum(asian / gradeCount, na.rm = TRUE)),
      .(year,
        shooting_type)] %>%
    melt(id.var = c('year','grade','shooting_type','number'),
         variable.factor = 'FALSE', variable.name = 'race',
         value.name = 'shootingEnrollment')
  
  # indiscriminate multiple casualty
  dt.ms <- data %>%
    .[low_grade <= grade
      & high_grade >= grade
      & shooting_type == 'indiscriminate'
      & casualties >= 2,
      .(shooting_type = 'mass shooting',
        grade = grade,
        number = .N,
        'All races' = sum(enrollment / gradeCount, na.rm = TRUE),
        'White, non-Hispanic' = sum(white / gradeCount, na.rm = TRUE),
        'Black or African-American' = sum(black / gradeCount, na.rm = TRUE),
        'Hispanic or Latino' = sum(hispanic / gradeCount, na.rm = TRUE),
        'Asian' = sum(asian / gradeCount, na.rm = TRUE)),
      .(year)] %>%
    melt(id.var = c('year','grade','shooting_type','number'),
         variable.factor = 'FALSE', variable.name = 'race',
         value.name = 'shootingEnrollment')
  
  dt <- rbind(dt, dt.ms)
  return(dt)
}

dt_wapo.sum <- lapply(-1:12, getGrade, data = dt_wapo) %>%
  rbindlist() %>%
  .[, any := sum(shootingEnrollment * (shooting_type != 'mass shooting')), .(year, grade, race)] %>%
  dcast(year + grade + race + any ~ shooting_type, value.var = 'shootingEnrollment', fill = 0) %>%
  melt(id.var = c('year','grade', 'race'),
       variable.factor = FALSE, variable.name = 'shooting_type',
       value.name = 'shootingEnrollment')

dt_match <- dt_acs[dt_wapo.sum, on = c('grade','race')] %>%
  .[grade >= 0]

dt_match[, rate := shootingEnrollment / acsEnrollment]

dt_match <- dt_match[order(race, shooting_type, year, grade)]

# naive, with replacement estimate
dt_match %>%
  .[,
    .(rate = sum(rate)),
    .(race,
      year,
      shooting_type)]

# without replacement. Prob of 1 or more shootings in school from K through 12
dt_results <- dt_match %>%
  .[,
    .(rate = 1 - prod(1 - rate),
      invprob = paste0('1 in ', round(1 / (1 - prod(1 - rate))))),
    .(race,
      year,
      shooting_type)] %>%
  .[order(race, year, -rate)]

dt_sum <- dt_results %>%
  .[year == 2021] %>%
  dcast(shooting_type ~ race, value.var = 'rate') %>%
  .[order(-`All races`)] %>%
  .[`shooting_type` %in% c('any', 'targeted', 'indiscriminate', 'mass shooting')] %>%
  .[, shooting_type2 := paste0(toupper(substr(shooting_type,1,1)), substr(shooting_type,2,nchar(shooting_type)))] %>%
  .[shooting_type2 == 'Any', shooting_type2 := 'Any shooting'] %>%
  .[shooting_type2 == 'Mass shooting', shooting_type2 := '*Mass shooting'] %>%
  melt(id.var = c('shooting_type', 'shooting_type2'),
       variable.factor = FALSE, variable.name = 'race',
       value.name = 'rate') %>%
  .[, label := paste0('1 in ', signif(1 / rate,  2))]

fwrite(dt_sum, 'summary.csv')

servr::httd()


bitmap <- rsvg::rsvg('chart1.svg', css = "style.css", width = 1700)
png::writePNG(bitmap, "chart1.png", dpi = 400)
